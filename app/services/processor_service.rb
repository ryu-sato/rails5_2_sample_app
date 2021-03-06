require 'fileutils'

class ProcessorService
  include Singleton

  def method_missing(method_name, *args)
    if method_name.to_s =~ /^replace_/
      return
    end
    super
  end

  def parse_commands(log)
    separator = '#####SEPARATOR#####'

    remove_unused_value(log).gsub(/(.*@)(test-hogehoge>\s*)/, separator)
      .split(separator)
      .inject([]) do |cmd_logs, block|
        result = block.lines
        name = result.slice!(0).chomp

        next cmd_logs if name.blank? || result.blank?

        cmd_logs << {
          name: name,
          result: result.join
        }
      end
  end

  def remove_unused_value(line)
    line.gsub(/^\[.*[0-9][0-9]:[0-9][0-9]:[0-9][0-9]\..*201[7|8|9]\] /, "")
  end

  def compare_command_sets(normal_cmdset, anomaly_cmdset)
    normal_log_string = normal_cmdset.command_logs.map(&:result).join
    anomaly_log_string = anomaly_cmdset.command_logs.map(&:result).join
    Diffy::Diff.new(normal_log_string, anomaly_log_string)
  end

  def compare_command(normal_log, anomaly_log)
    Diffy::Diff.new(normal_log.result, anomaly_log.result)
  end

  def replace_method_name(command_name)
    "replace_".concat(command_name)
      .gsub(/\s/, '_')
      .gsub('|', '-')
      .gsub('/', '-')
      .underscore
  end

  def replace_show_system_uptime_no_forwarding(string)
    string.gsub(/^(\s*Current time: )[\d\s:-]+JST/, '\1')
  end
end
