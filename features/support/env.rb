ENV['GEM_ROOT'] = FileUtils.pwd
ENV['TD_ROOT'] = File.join(ENV['GEM_ROOT'],"test_data")

Before('@slow_process') do
  @aruba_io_wait_seconds = 7
end
