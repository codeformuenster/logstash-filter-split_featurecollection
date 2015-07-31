# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

class LogStash::Filters::Example < LogStash::Filters::Base

  config_name "split_featurecollection"

  public
  def register
    # No instance variables needed atm
  end

  public
  def filter(event)
    @logger.debug('Spliting FeatureCollection')
    event['features'].each do |feature|
      event_feature = LogStash::Event.new(feature)
      # decorate(event_feature)
      filter_matched(event_feature)
      yield event_feature
    end
    event.cancel

  end
end
