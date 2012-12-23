class VisualBuild < ActiveRecord::Base
  # copied from travis-core/lib/travis/model/build/matrix.rb
  # clearly a workaround
 ENV_KEYS = [:rvm, :gemfile, :env, :otp_release, :php, :node_js, :scala, :jdk, :python, :perl, :compiler, :go]

  def self.from_json(json_str)
    visual_build = self.new
    json = JSON.parse(json_str)
    f = [:id,:result,:number,:started_at,:finished_at,:duration,:build_url,:commit,:branch,:committed_at,:author_name, :committer_name]
    f.each do | field |
      visual_build.send( "#{field}=",json[field.to_s])
    end
    visual_build.set_config_fields(json["config"])
    visual_build
  end
  def set_config_fields(json)
    self.language=json["language"]
  end


end
