import crypt

def hash_passwd(s):
    return crypt.crypt(s, '$1$xyz')

CONFIG = { 'customera': {'password': hash_passwd('secreta'),
                   'indexes': ('customera-*',),
                   'userdata_index': 'customera'},
           'customerb': {'password': hash_passwd('secretb'),
                    'indexes': ('customerb-*', ),
                    'userdata_index': 'customerb'},
           'customerc': {'password': hash_passwd('secretc'),
                    'indexes': ('customerc-*', ),
                    'userdata_index': 'customerc'},
           'kumina': {'password': hash_passwd('secretk'),
                         'indexes':('customera-*', 'customerb-*', 'customerc-*'),
                         'userdata_index': 'kumina'},
           'superuser': {'password': 'geheim',
                         'indexes':('customera-*', 'customerb-*', 'customerc-*'),
                         'userdata_index': 'superuser'},
         }

KIBANA_UPSTREAM = "http://localhost:5601"
ES_UPSTREAM = "http://localhost:9200"
ES_USERDATA_PREFIX = '.kibana'
