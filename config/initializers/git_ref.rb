# Capistrano deployment
git_ref = File.read(Rails.root.join('REVISION')).strip rescue nil
# Development
git_ref ||= `git rev-parse HEAD`.chomp rescue nil

# It's easy to bust UDP packet size, which breaks JSON payload.
# So let's keep it short.
if git_ref
  git_ref = git_ref[0..6] # The length returned by `git rev-parse --short`
else
  Rails.logger.warn "Unable to determine current git ref"
  git_ref = '(unknown)'
end

GIT_REF = git_ref.freeze
