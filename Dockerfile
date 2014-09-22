FROM rails:onbuild
MAINTAINER mccabe615

ADD script/start /start

RUN chmod a+x /start

user root

ENV RAILS_ENV development

CMD /start
