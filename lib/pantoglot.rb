require "pantoglot/version"
require 'linguist'

module Pantoglot
  extend self
  def process(path)
    return nil if !File.exists?(path)
    if File.file?(path)
      return Pantoglot.analyze(path)
    end
    loc = 0
    sloc = 0
    children = []
    Dir.foreach(path) do |name|
      # Skip . and ..
      next if name == '.' || name == '..' || name == '.git'
      fullpath = path + '/' + name
      if File.directory?(fullpath)
        child = Pantoglot.process(fullpath)
      elsif File.file?(fullpath)
        child = Pantoglot.analyze(fullpath)
      end
      next if child == nil
      loc = loc + child[:loc]
      sloc = sloc + child[:sloc]
      children << child
    end
    tree = {
      name: File.basename(path),
      path: path,
      type: 'directory',
      loc: loc,
      sloc: sloc,
      children: children
    }
  end
  def analyze(path)
    blob = Linguist::FileBlob.new(path)
    return nil if blob.symlink?
    # Skip non-Text
    return nil if !blob.text?
    # Skip when language not detectable
    return nil if !blob.language
    analysis = {
      name: blob.name,
      path: blob.path,
      language: blob.language,
      loc: blob.loc ? blob.loc : 0,
      sloc: blob.sloc ? blob.sloc : 0,
      size: blob.size ? blob.size : 0,
      vendored: blob.vendored?,
      generated: blob.generated?,
      documentation: blob.documentation?
    }
  end
end
