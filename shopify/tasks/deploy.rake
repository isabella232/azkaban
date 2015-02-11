desc "Upload jars to servers"
task :upload do
  on roles(:web) do |host|
    execute :mkdir, '-p /tmp/azkaban'
    upload! 'build/distributions/azkaban-web-server-2.6.4.tar.gz', '/tmp/azkaban/'

    within '/tmp/azkaban/' do
      execute :tar, '-xzf azkaban-web-server-2.6.4.tar.gz'
      execute :mv, "azkaban-web-server-2.6.4/* #{fetch(:deploy_to)}/current/"
    end
  end

  on roles(:executor) do |host|
    execute :mkdir, '-p /tmp/azkaban'
    upload! 'build/distributions/azkaban-exec-server-2.6.4.tar.gz', '/tmp/azkaban/'

    within '/tmp/azkaban/' do
      execute :tar, '-xzf azkaban-exec-server-2.6.4.tar.gz'
      execute :mv, "azkaban-exec-server-2.6.4/* #{fetch(:deploy_to)}/current/"
    end
  end
end
