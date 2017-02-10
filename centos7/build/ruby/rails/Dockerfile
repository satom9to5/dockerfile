FROM satom9to5/ruby:2.3.3

RUN rm -rf /ansible-playbook 
RUN git clone https://github.com/satom9to5/ansible-pj-tmpl.git /ansible-playbook 
WORKDIR /ansible-playbook 
RUN git submodule init \
    && git submodule update

RUN ansible-playbook dockerfile.ruby.rails.yml -e ruby__install=no -e ruby_gem_packages_bundler__path=/rails/vendor/bundle

RUN mkdir -p /rails
ENV APP_ROOT=/rails
WORKDIR /rails

CMD ["rails" "server"]
