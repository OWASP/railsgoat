# frozen_string_literal: true

# Rails 8 ReDoS Protection
# Enable automatic timeout for regular expressions to prevent ReDoS attacks
# Default: 1 second timeout for regex operations
#
# This is a Rails 8 security feature that prevents catastrophic backtracking
# in regular expressions from hanging the application.
#
# See: R8-A1-ReDoS tutorial in wiki for exploitation details

Regexp.timeout = 1.0  # 1 second timeout
