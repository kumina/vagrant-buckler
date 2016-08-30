import crypt

def hash_passwd(s):
    return crypt.crypt(s, '$1$xyz')

CONFIG = { 'customera': {'password': hash_passwd('secreta'),
                   'indexes': ('customera-*',)},
           'customerb': {'password': hash_passwd('secretb'),
                    'indexes': ('customerb-*', )},
           'customerc': {'password': hash_passwd('secretc'),
                    'indexes': ('customerc-*', )},
           'kumina': {'password': hash_passwd('secretk'),
                         'indexes':('customera-*', 'customerb-*', 'customerc-*')},
           'superuser': {'password': 'geheim',
                         'indexes':('customera-*', 'customerb-*', 'customerc-*')}
         }

KIBANA_UPSTREAM = "http://localhost:5601"
ES_UPSTREAM = "http://localhost:9200"
