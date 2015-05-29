require "pathname"
require "xcodeproj"
$JSONTypeArray = "array"
$JSONTypeInt64 = 'int64'
$JSONTypeInt32 = 'int32'
$JSONTypeObject = 'object'
$JSONTypeString = 'string'
$JSONTypeURL = 'url'
$JSONTypeDate = 'date'

$JSONModelCache = Hash.new
class AssertionError < RuntimeError
end

def assert (m)
  if yield == false
      puts m
      raise AssertionError
  end
end

class JSONRecord
  attr_accessor :name
  attr_accessor :type
  def initialize(type, name)
    @name = name
    @type = type
  end

  def codeOutput
    nil
  end
end


class JSONModel
  attr_accessor :records
  attr_accessor :name
  def initialize
    @records = []
  end

  def addRecord(record)
    assert('record == nil') {record != nil}
    assert('record is not class of JSONRecord'){record.is_a?(JSONRecord)}
    @records << record
  end
end


def GetJSONModel(key)
  model = $JSONModelCache[key]
  model = JSONModel.new() unless model != nil
  model.name = key
  $JSONModelCache[key] = model
  model
end

def model(modelName)
  model = GetJSONModel(modelName)
  yield model
end



def OutputModel(model)
    header = ''
end


#oc代码生成

def OC_Property2(p1, p2, type, name)
  "@property(" + p1 + "," + p2 + ")" + " " + type + " " + name + ";\n"
end

def OC_Property_Object(type, name)
  type = type+"*"
  OC_Property2("nonatomic", "strong", type , name)
end

def OC_Property_Number(type, name)
  OC_Property2("nonatomic", "assign", type, name)
end
class OCObjectRecord < JSONRecord
  def codeOutput
      OC_Property_Object(@type, @name)
  end
end

class OCCustomObjectRecord < OCObjectRecord
  def jsonTransformer
"
+ (NSValueTransformer*) #{@name}JSONTransformer
{
   return [NSValueTransformer mtl_validatingTransformerForClass:NSClassFromString(@\"#{@type}\")];
}
"
  end
end

class OCArrayRecord < OCObjectRecord
  attr_accessor :ocClass
  def initialize(type = $JSONTypeArray, name, ocClass)
    super(type, name)
    @ocClass = ocClass

  end

  def jsonTransformer
    " \n
    + (NSValueTransformer*) #{@name}JSONTransformer  {
      return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:
                                  [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSClassFromString(@\"#@ocClass\")]];
    }
    "
  end

  def importHeader
    "#import \"#{@name}.h\" \n"
  end
end
class OCNumberRecord < JSONRecord
  def codeOutput
    OC_Property_Number(@type, @name)
  end
end

def array(name, ocClass ,model=nil)
  r = OCArrayRecord.new("NSArray",name, ocClass)
  model.addRecord(r)
end

def object(name, ocClass, model = nil)
  r = OCCustomObjectRecord.new(ocClass, name, model)
  model.addRecord(r)
end
def number(type, name, model = nil)
  r= OCNumberRecord.new(type, name)
  model.addRecord(r)
end


def int32(name, model)
  number("int32_t", name , model)
end

def int64(name, model)
  number "int64_t", name, model
end

def float(name, model)
  number "float" ,name ,model
end


def double(name, model)
  number "double", name, model
end

def bool(name, model)
  number "BOOL", name, model
end

def string(name, model)
  r = OCObjectRecord.new("NSString",name)
  model.addRecord(r)
end

def OC_Class_HeaderWithProperties(name, properties)
  out = "@interface " + name + "\n"
  properties.each { |x|
    out = out + x + "\n"
  }
  out = out + "@end"
  out
end

def OCClassHeaderWithModel(m)
  ocHeader= '''
#import <Mantle.h>
<import_class>
@interface <class_name> : MTLModel <MTLJSONSerializing>
<properties>
@end
  '''

  p = ""
  m.records.each { |r|
    p = p + r.codeOutput
  }

  ocHeader = ocHeader.gsub(/<properties>/, p)
  ocHeader = ocHeader.gsub(/<class_name>/, m.name)

  importClass = ""

  ocHeader = ocHeader.gsub(/<import_class>/, importClass)

  ocHeader
end

def OCClassImplitationWithModel(m)

  ocIm = '''
#import "<header_name>.h"
@implementation <class_name>
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{<keyValues>
            };
}
<JSON_FUNCTIONS>
@end
'''

  keys = "";
  m.records.each{ |r|
    keys = keys + "@\"#{r.name}\":@\"#{r.name}\",\n"
  }

  ocIm = ocIm.gsub(/<class_name>/, m.name)
  ocIm = ocIm.gsub(/<keyValues>/,keys)
  ocIm = ocIm.gsub(/<header_name>/, m.name)

  funcs = ""
  m.records.each{ |r|
    if r.respond_to?("jsonTransformer")
      funcs = funcs + r.jsonTransformer +  "\n"
    end
  }

  ocIm = ocIm.gsub(/<JSON_FUNCTIONS>/, funcs)

  ocIm
end

def OC_Class_MapKey(records)

end



def PathJoin(dir,name)
  if dir.end_with?("/")
    return dir + name
  else
    return dir + "/" + name
  end
end


def WriteDataToFile(text, path)
  if File.exist?(path)
    File.delete(path)
  end
  file = File.new(path, "w")
  file.puts text
  file.close

end


def OutPutFiles(dir)
  Dir.mkdir(dir) unless File.exist?(dir)
  $JSONModelCache.each_value{|m|
    header = OCClassHeaderWithModel(m)
    implitation = OCClassImplitationWithModel(m)
    headerPath = PathJoin(dir, m.name + ".h")
    imPath = PathJoin(dir, m.name + ".m")
    WriteDataToFile(header, headerPath)
    WriteDataToFile(implitation, imPath)
  }
end

def FindPathHasFile(currentPath, name)
  cp = Pathname.new(currentPath)
  realpath = cp.realpath
  if realpath.to_path== '/'
    return nil
  end

  path = nil
  Dir.foreach(realpath) do |e|
    if e.end_with?(name)
      path = PathJoin(realpath.to_path,e)
    end
  end
  if path == nil
    p = Pathname.new(currentPath)
    return FindPathHasFile(p.realpath.parent, name)
  else
    return path
  end
end



def FindProject
  projpath = FindPathHasFile("./", ".xcodeproj")
  p = Pathname.new(projpath).realpath.parent
  filesPath = p.join("LuTu","Classes", "Models", "ProtocolModels", "GenModels").to_path
  puts filesPath
  OutPutFiles(filesPath)
  project = Xcodeproj::Project.open(projpath)
  target = project.targets.first
  group = project.main_group.find_subpath(File.join("LuTu", "Classes", "Models", "ProtocolModels", "GenModels"), true)
  puts group
  group.clear
  fileRefs = []
  Dir.foreach(filesPath) do |file|
    puts file
    if file.end_with?(".")
      next
    end
    fpath = PathJoin(filesPath, file)
    puts fpath
    ref = group.new_reference(fpath)
    fileRefs << ref
  end

  target.add_file_references(fileRefs)

  project.save
end


#服务器协议模型
#发现中的category
model("PMCategory") { |m|
  string "categoryId", m
  string "name", m
  string "label", m
  string "introImageUrl", m
  int32 "routeCount", m
}

#发现返回的数据
model("PMCategoryListRsp") { |m|
  int32 "offset", m
  int32 "limit", m
  int32 "total", m
  array "list", "PMCategory", m
}


#车友会信息
#
model("PMCarClubInfo") {|m|
  string "carClubId",m
  string "name",m
  string "introText",m
  string "introImageUrl",m
  array "memberList", "PMClubMember",m
}

model("PMClubMember") {|m|
  string "name",m
  string "memberType",m
  string "vihicleModel",m
  string "avatarUrl",m
}

#车友会查询回调

model("PMSearchClubRsp") { |m|
  int32 "offset", m
  int32 "limit", m
  int32 "total", m
  array "list", "PMSearchClubInfo", m
}

model("PMSearchClubInfo") { |m|
  string "carClubId", m
  string "name", m
  string "introText", m
  string "introImageUrl", m
  int32 "threadCount", m
  int32 "userCount", m
}

#用户车友会列表

model("PMUserClubRsp") { |m|
  array "result", "PMUserClubInfo", m
}

model("PMUserClubInfo") { |m|
  string "carClubId", m
  string "name", m
  string "introText", m
  string "introImageUrl", m
}

#车友会帖子列表
model("PMThreadListRsp") { |m|
  int32 "offset", m
  int32 "limit", m
  int32 "total", m
  array "list", "PMThreadInfo", m
}

model("PMThreadInfo") { |m|
  string "threadId", m
  string "clubId", m
  string "title", m
  string "creatorId", m
  int32 "postCount", m
  string "carClubName", m
  string "userName", m
  string "userAvastarurl", m
  string "content", m
}

#车友会回复列表

model("PMThreadPostList") {|m|
   int32 "offset", m
  int32 "limit", m
  int32 "total", m
  array  "list", "PMThreadPostInfo", m
}

model ("PMThreadPostInfo") { |m|
  string "postId" , m
  string "threadId" , m
  string "content" , m
  int64 "createTime" , m
  string "creatorName" , m
  string "creatorAvatarUrl" , m
}

#个人信息获取

model("PMUserInfoShowRsp") { |m|
  string "userId" , m
  string "name" , m
  string "city" , m
  string "phone" , m
  string "avatarUrl" , m
  string "vehicleModel" , m
  string "drivingYear" , m
  string "status" , m
  int32 "oauthType" , m
  int64 "createTime" , m
}

#用户概览数据

model("PMUserSummaryRsp") { |m|
  int32 "clubMemberCount" , m
  int32 "threadCount" , m
  string "userName" , m
}


#我的收藏

model("PMFavoriteListRsp") {|m|
  int32 "offset" , m
   int32 "limit" , m
  int32 "total" , m
  array  "list" , "PMFavoriteInfo" , m
}

model("PMFavoriteInfo") { |m|
  string "routeId" , m
  string "name" , m
  string "introImageUrl" , m
  int64 "createTime" , m
}


#我的车友会
model("PMUserClubRsp") { |m|
  array "result", "PMUserClubInfo", m
}

model("PMUserClubInfo") { |m|
  string "carClubId", m
  string "name", m
  string "introText", m
  string "introImageUrl", m
  int32 "userCount", m
  int32 "threadCount", m
}

#我的帖子列表

model("PMUserThreadListRsp") { |m|
  int32 "offset", m
  int32 "limit", m
  int32 "total", m
  array "list", "PMUserThreadInfo", m
}

model("PMUserThreadInfo") { |m|
  string "threadId", m
  string "clubId", m
  string "title", m
  string "creatorId", m
  int32 "postCount", m
  string "carClubName", m
  string "userName", m
  string "userAvastarurl", m
  string "content", m
}




FindProject()
