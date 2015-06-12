$LOAD_PATH.unshift(File.dirname(__FILE__))

require "pathname"
require "xcodeproj"
require "genrequest"
require "genmodels"
require "utilities"

def FindProject
  projpath = FindPathHasFile("./", ".xcodeproj")
  p = Pathname.new(projpath).realpath.parent
  root = p.to_path
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


  subclassses = []
  superclasses = []

  $JSONReqeustCache.each_value { |req|
    output = req.output

    subclassses << output.header
    subclassses << output.implitation

    superclasses << output.superHeader
    superclasses << output.superImplitaion
  }

  OutPutFileTo(root, "LuTu/Classes/Network/GenRequest", project, superclasses, true)
  OutPutFileTo(root, "LuTu/Classes/Network/GenProtocols", project, subclassses, false)
  project.save
end




#服务器协议模型

#单个多个线路信息获取
model("PMRouteInfo") { |m|
  string "routeId", m
  string "name", m
  string "introImageUrl", m
  int32 "favCount", m
  point "location", m
  array "categoryList", "NSString", m
}

model("PMRouteListRsp") { |m|
  int32 "offset", m
  int32 "limit", m
  int32 "total", m
  array "list", "PMRouteInfo", m
}

requestModel("LTRoadListReq") { |req|
  method "/route/list",  req
  response "PMRouteListRsp", req
  p_int64 "pageNo", req
  p_int64 "pageSize", req
  p_string "cityId", req
  p_string "name", req
  p_string "categoryName", req
 }

#线路详细信息获取

model("PMRoutePropInfo") { |m|
  string "routeId", m
  string "propId", m
  string "detailId", m
  string "propName", m
  string "propDesc", m
  string "propValue", m
}

model("PMRoutePoiInfo") { |m|
  string "poiId", m
  string "routeId", m
  string "name", m
  int32 "type", m
  bool "cover", m
  int32 "routeIndex", m
  string "arrivalTime", m
  point "location", m
  string "introImageUrl", m
  string "introText", m
}

model("PMRouteLineInfo") { |m|

  string "lineId", m
  string "routeId", m
  string "name", m
  int32 "routeIndex", m
  string "locationStart", m
}
model("PMRouteDetailRsp") { |m|
  array "categoryList", "PMCategoryInfo", m
  bool "isFav", m
  string "name", m
  string "introImageUrl", m
  int64 "favCount", m
  string "totalTime", m
  string "carType", m
  string "totalDistance", m
  string "routeStatus", m
  array "routePropDetails", "PMRoutePropInfo", m
  array "pois", "PMRoutePoiInfo", m
  array "lines", "PMRouteLineInfo", m

}

requestModel("LTRouteDetailReq") { |r|
  method "/route/detail", r
  p_string "userId", r
  p_string "routeId", r
  response "PMRouteDetailRsp", r
}

#添加线路评论

model("PMNullModel") { |m|

}
requestModel("LTAddRouteCommentReq"){ |r|
  method "/route/addRouteComment", r
  response "PMNullModel", r
  p_string "content", r
  p_string "creatorId", r
  p_string "routeId", r
}
#获取线路评论列表
#
model("PMRouteCommentInfo") {|m|
  string "id", m
  string "routeId", m
  string "content", m
  string "creatorId", m
  string "createTime", m
  string "avatarUrl", m
  string "createName", m
}

model("PMGetRouteCommentsRsp") { |m|
  int64 "offset", m
  int64 "limit", m
  int64 "total", m
  array "list", "PMRouteCommentInfo", m
}
requestModel("LTGetRouteCommentsReq") { |r|
  method "/route/getRouteComment", r
  response "PMGetRouteCommentsRsp", r
  p_int64 "pageNo", r
  p_int64 "pageSize", r
  p_string "routeId", r
}

#收藏线路

requestModel("LTRouteCollectReq") { |r|
  method "/route/collect", r
  response "PMNullModel", r
  p_string "creatorId", r
  p_string "routeId", r
}

#取消收藏线路

requestModel("LTRouteCancelCollectReq") { |r|
  method "/route/cancelCollect" , r
  response "PMNullModel" , r
  p_string "creatorId" , r
  p_string "routeId" , r
}

#为线路点赞

requestModel("LTRouteFavAdd") { |r|
  method "/route/fav/add", r
  response "PMNullModel", r
  p_string "creatorId", r
  p_string "routeId", r
}

#单个 多个分类信息获取

model("PMCategoryInfo") { |m|
  string "categoryId", m
  string "name", m
  string "label", m
  string "introImageUrl", m
  int32 "routeCount", m
}

model("PMCategoryListRsp") { |m|
  int64 "offset", m
  int64 "limit", m
  int64 "total", m
  array "list", "PMCategoryInfo", m
}

requestModel("LTCategoryListReq") { |r|
  method "/category/list", r
  response "PMCategoryListRsp", r
  p_int64 "pageNo", r
  p_int64 "pageSize", r
  p_string "cityId", r
}
#车友会信息展示
model("PMCarClubInfo") {|m|
  string "carClubId",m
  string "name",m
  string "introText",m
  string "introImageUrl",m
  array "memberList", "PMClubMember",m
}

requestModel("LTCarClubInfoShowReq") { |r|
  method "/car_club/info/show", r
  response "PMCarClubInfo", r
  p_string "carClubId", r
}

model("PMClubMember") {|m|
  string "name",m
  int32 "memberType",m
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

requestModel("LTCarClubSerachReq") { |m|
  method "/car_club/search", m
  p_int64 "pageNo", m
  p_int64 "pageSize", m
  p_string "name", m

  response "PMSearchClubInfo", m
}


#用户车友会列表

model("PMUserCarClubSimpleRsp") { |m|
  array "list", "PMUserCarClubSimpleInfo", m
}

model("PMUserCarClubSimpleInfo") { |m|
  string "carClubId", m
  string "name", m
  string "introText", m
  string "introImageUrl", m
}

requestModel("LTUserCarClubSimpleListReq") { |r|
  method "/user/car_club/simple/list", r
  response "PMUserCarClubSimpleRsp", r
  p_string "userId", r
}

#加入车友会
#
requestModel("LTCarClubMemberJoinReq") { |r|
  method "/car_club/member/join", r
  response "PMNullModel", r
  p_string "userId", r
  p_string "carClubId", r
}

#用户退出车友会
#
requestModel("LTCarClubMemberQuitReq") { |r|
  method "/car_club/member/quit", r
  response "PMNullModel", r
  p_string "userId", r
  p_string "carClubId", r
}

#车友会发表话题

requestModel("LTThreadNewReq") {|r|
  method "/thread/new", r
  response "PMNullModel", r
  p_string "creatorId", r
  p_string "clubId", r
  p_string "title", r
  p_string "content", r
  p_int64 "images", r
}

#车友会帖子列表

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

model("PMThreadListRsp") { |m|
  int32 "offset", m
  int32 "limit", m
  int32 "total", m
  array "list", "PMThreadInfo", m
}

requestModel("LTThreadListReq") { |m|
  method "/thread/list" , m
  response "PMThreadListRsp" , m
  p_int64 "pageNo" , m
  p_int64 "pageSize" , m
  p_string "carClubId" , m
}

#车友会回复列表

model("PMThreadPostListRsp") {|m|
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

requestModel("LTThreadPostListReq") { |r|
  method "/thread/post/list" , r
  response "PMThreadPostListRsp" , r
  p_int64 "pageNo" , r
  p_int64 "pageSize" , r
  p_string "pageId" , r
  p_string "creatorId" , r
}

#车友会回复跟帖


requestModel("LTThreadPostNewReq") { |r|
  method "/thread/post/new" , r
  response "PMNullModel" , r
  p_string "userId" , r
  p_string "threadId" , r
  p_string "content" , r
}

#个人信息补充


requestModel("LTUserInfoCompleteReq") { |r|
  method "/user/info/complete" , r
  response "PMNullModel" , r
  p_string "name" , r
  p_string "ctiy" , r
  p_string "phone" , r
  p_string "avatarUrl" , r
  p_string "vehicleModel" , r
  p_string "drivingYear" , r
  p_int64 "oauthType" , r
  p_string "userId" , r
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

requestModel("LTUserInfoShowReq") { |r|
  method "/user/info/show" , r
  response "PMUserInfoShowRsp" , r
  p_string "userId" , r
}
#用户概览数据

model("PMUserStatsListRsp") { |m|
  int32 "clubMemberCount" , m
  int32 "threadCount" , m
  string "userName" , m
}

requestModel("LTUserStatsListReq") { |r|
  method "/user/stats/list" , r
  response "PMUserStatsListRsp" , r
  p_string "userId" , r
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

requestModel("LTUserFavoriteRouteListReq") { |r|
  method "/user/favorite/route/list" , r
  response "PMFavoriteListRsp" , r
  p_int64 "pageNo" , r
  p_int64 "pageSize" , r
  p_string "userId" , r
}

#我的车友会
model("PMUserClubListRsp") { |m|
  array "list", "PMUserClubInfo", m
}

model("PMUserClubInfo") { |m|
  string "carClubId", m
  string "name", m
  string "introText", m
  string "introImageUrl", m
  int32 "userCount", m
  int32 "threadCount", m
}

requestModel("LTUserCarClubListReq") { |r|
  method "/user/car_club/list" , r
  response "PMUserClubListRsp" , r
  p_string "userId" , r
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

requestModel("LTUserThreadListReq") { |r|
  method "/user/thread/list" , r
  response "PMUserThreadListRsp" , r
  p_int64 "pageNo" , r
  p_int64 "pageSize" , r
  p_string "userId" , r
}

#搜索接口

model("PMRouteSearchInfo") { |m|
  string "carType", m
  int64 "createTime", m
  string "favCount", m
  string "introImageUrl", m
  point  "location", m
  string "name", m
  string "routeId", m
  string "routeStatus", m
  string "status", m
  string "totalDistance", m
  string "totalTime", m
}

model("PMClubSearchInfo") { |m|
  string "carClubId", m
  int64 "createTime", m
  string "creatorId", m
  string "introImageUrl", m
  string "introText", m
  string "isDefault", m
  string "memberList", m
  string "name", m
  int32 "memberCount", m
  int32 "threadCount", m
}

model("PMThreadSearchInfo") { |m|
  string "carClubName", m
  string "clubId", m
  string "content", m
  int64 "createTime", m
  string "creatorId", m
  string "images", m
  int64 "postCount", m
  string "threadId", m
  string "title", m
  string "userAvastarurl", m
  string "userName", m
}

model("PMSearchRsp") { |m|
  array "routes", "PMRouteSearchInfo" , m
  array "clubs", "PMClubSearchInfo" , m
  array "threads", "PMThreadSearchInfo" , m
}

requestModel("LTSearchReq") { |r|
  method "/search" , r
  response "PMSearchRsp" , r
  p_string "city" , r
  p_string "keyword" , r
}

#我的动态列表

model("PMUserNewsInfo")  {|m|
  string "dynamicId", m
  string "content", m
  int64 "createTime", m
  string "userId", m

}
model("PMUserDynamicListRsp") { |m|
  int64 "offset", m
  int64 "limit", m
  int64 "total", m
  array "list", "PMUserNewsInfo", m
}
requestModel("LTUserDynamicListReq") { |m|
  method "/user/dynamic/list", m
  p_int64 "pageNo", m
  p_int64 "pageSize", m
  p_string "userId", m
  response "PMUserDynamicListRsp", m
}

#w我的消息

model("PMUserMessageInfo") { |m|
  string "messageId", m
  string "content", m
  string "userId", m
  int64 "createTime", m
}

model("PMUserMessageListRsp") { |m|

  int64 "offset", m
  int64 "limit", m
  int64 "total", m
  array "list", "PMUserMessageInfo", m

}

requestModel("LTUserMessageListReq") { |m|
  method "/user/message/list", m
  response "PMUserMessageListRsp", m
  p_int64 "pageNo", m
  p_int64 "pageSize", m
  p_string "userId", m
}

FindProject()
