import json

with open('./Exported_Data/items.json', 'r') as f:
    data = json.loads(f.read())

with open('./items.sql', 'w') as f2:
    f2.write('INSERT INTO items (item_id, iname, descrip) \n\t VALUES ') 
    for item in data['items']:
        f2.write("\t('%s', '%s', '%s'),\n" % (item['id'], item['name'].replace("'",""), item['desc'].replace("'","")))
