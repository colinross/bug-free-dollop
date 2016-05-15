FROM ruby:alpine
ENV PACKAGES = "nodejs"
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
