module RBEM
  class Template
    def initialize(rbm_code, filename='(rbm)', lineno=1)
      @block = ZenScope.void.eval(<<-EOT, filename, lineno-1)
        Proc.new do
          #{rbm_code}
        end
      EOT
    end

    module ZenScope
      def self.void
        return binding
      end
    end
  end
end


