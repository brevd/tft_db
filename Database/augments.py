import json

with open('./Exported_Data/augments.json', 'r') as f:
    data = json.loads(f.read())

with open('./augments.sql', 'w') as f2:
    f2.write('INSERT INTO augments (augment_id, aname, descrip) \n\t VALUES ') 
    for augment in data['augment_items']:
        f2.write("\t('%s', '%s', '%s'),\n" % (augment['id'], augment['name'].replace("'",""), augment['desc'].replace("'","")))
