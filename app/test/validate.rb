# frozen_string_literal: true
require 'active_support/core_ext/object/deep_dup'
@ml_response = nil
def ml_response_without_downvotes
  @_ml_response_without_downvotes ||= begin
                                        @ml_response.deep_dup.tap do |new_response|
                                          new_response['resolved_similar_tickets'].reject! { |ticket| downvoted_ids.include?(ticket["ticket_id"]) }
                                          new_response['unresolved_similar_tickets'].reject! { |ticket| downvoted_ids.include?(ticket["ticket_id"]) }
                                        end
                                      end
end

def downvoted_ids
  @_downvoted_ids ||= [1,2]
end
puts ml_response_without_downvotes

