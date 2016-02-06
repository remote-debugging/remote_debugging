require 'json'

module RemoteDebugging
  class Message
    DOMAIN_SEPERATOR = '.'

    def self.response(id:, method: nil, **result)
      self.new id:     id,
               method: method,
               result: result
    end

    def self.from_json(content, type: nil)
      json = JSON.parse content
      from_hash 'id'     => json.delete('id'),
                'method' => json.delete('method'),
                'params' => json.delete('params'),
                'type'   => type,
                **json
    rescue JSON::ParserError => e
      puts "json parse error: #{content}" #todo: remove this line, or have a decent logger or something
      from_hash 'params' => { contents: content.to_s },
                'type'   => type
    end

    def self.from_hash(hash = {})
      self.new id:     hash.delete('id'),
               method: hash.delete('method'),
               type:   hash.delete('type'),
               params: hash.delete('params') || {},
               **hash
    end

    attr_reader :id, :method, :params, :type, :additional_params

    def initialize(id: nil, method: nil, params: nil, type: nil, **additional_params)
      @id                = id
      @type              = type
      @method            = method
      @params            = params
      @additional_params = additional_params
    end

    def merge(other)
      merged = self.to_hash.merge(other.to_hash)

      # we can't determine an id when we and the other hash don't agree
      merged.reject! {|key, _| key == 'id'} unless self.id == other.id

      self.class.from_hash merged
    end

    def domain
      method.split(DOMAIN_SEPERATOR).first if method
    end

    def command
      method.split(DOMAIN_SEPERATOR)[1..-1].join(DOMAIN_SEPERATOR) if method
    end

    def to_json
      to_hash.reject { |key, _| key == 'type' }.to_json
    end

    def inspect
      to_hash.merge('domain' => domain, 'command' => command).to_json
    end

    def to_hash
      {
        'id'     => id,
        'method' => method,
        'params' => params,
        'type'   => type,
        **additional_params
      }.reject { |_, value| value == nil }
    end

    private
  end
end
