CONFIG = { 'customera': {'password':'secreta',
                   'indexes': ('customera-*',)},
           'customerb': {'password': 'secretb',
                    'indexes': ('customerb-*', )},
           'customerc': {'password': 'secretc',
                    'indexes': ('customerc-*', )},
           'kumina': {'password': 'secretk',
                         'indexes':('customera-*', 'customerb-*', 'customerc-*')},
           'superuser': {'password': 'geheim',
                         'indexes':('customera-*', 'customerb-*', 'customerc-*')}
         }

KIBANA_UPSTREAM = "http://localhost:5601"
ES_UPSTREAM = "http://localhost:9200"
