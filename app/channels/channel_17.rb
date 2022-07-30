
          class Channel_17 < ApplicationCable::Channel
            def subscribed
              stream_from self.class
            end

            def unsubscribed; end
          end
        
