FROM satom9to5/ruby:2.3.3

WORKDIR /ansible-playbook 
RUN    git pull origin master \
    && git submodule init \
    && git submodule update

RUN ansible-playbook dockerfile.ruby.rails.yml -e ruby__install=no -e ruby_gem_packages_bundler__path=/rails/vendor/bundle

RUN    sudo mkdir -p /rails \
    && sudo chown $(id -u):$(id -g) /rails
ENV APP_ROOT=/rails
WORKDIR /rails

CMD ["rails" "server"]
