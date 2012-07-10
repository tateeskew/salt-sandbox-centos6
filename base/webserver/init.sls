synthesyswebsite:
  file.managed:
    {% if grains['os'] == 'CentOS'%}
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://webserver/httpd.conf
    {% elif grains['os'] == 'Ubuntu'%}
    - name: /etc/apache2/sites-available/synthesysplatform
    - source: salt://webserver/synthesysplatform
    {% endif %}
    - require:
        - pkg: apache

{% if grains['os'] == 'Ubuntu'%}
a2dissite default:
  cmd:
    - run
{% endif %}

{% if grains['os'] == 'Ubuntu'%}
a2ensite synthesysplatform:
  cmd:
    - wait
    - unless: test -L /etc/apache2/sites-enabled/synthesysplatform
    - watch:
      - file: synthesyswebsite
{% endif %}

apache:
   pkg:
     - installed
     {% if grains['os'] == 'CentOS'%}
     - name: httpd
     {% elif grains['os'] == 'Ubuntu'%}
     - name: apache2
     {% endif %}
   service:
     - running
     {% if grains['os'] == 'CentOS'%}
     - name: httpd
     {% elif grains['os'] == 'Ubuntu'%}
     - name: apache2
     {% endif %}
     - watch:
       - file: synthesyswebsite
