import json

with open('./Exported_Data/set_6_champions.json', 'r') as f:
    data = json.loads(f.read())

with open('./champ_data.sql', 'w') as f2:
    f2.write('INSERT INTO units (char_id, cname, cost) \n\t VALUES ') 
    for char in data['6']['champions']:
        f2.write("\t('%s', '%s', '%s'),\n" % (char['apiName'], char['name'].replace("'",""), char['cost']))
