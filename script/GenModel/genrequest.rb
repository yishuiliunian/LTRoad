$LOAD_PATH.unshift(File.dirname(__FILE__))
require "request"

def OutPutFileTo(rootPath, subpath, project, files, over)
  p = Pathname.new(rootPath).join(subpath).to_path
  if over == true
    Dir.mkdir(p) unless  File.exist?(p) == true
    ClearPath(p)
  end
  target = project.targets.first
  group = project.main_group.find_subpath(subpath, true)
  group.clear

  files.each {|f|
    path = PathJoin(p, f.name)
    if File.exist?(path) && over == false
      next
    end

    WriteDataToFile(f.content, path)
  }

  fileRefs = []
  Dir.foreach(p) do |file|
    if file.end_with?(".")
      next
    end
    fpath = PathJoin(p, file)
    ref = group.new_reference(fpath)
    fileRefs << ref
  end
  target.add_file_references(fileRefs)
end
