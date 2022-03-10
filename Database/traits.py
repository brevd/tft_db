import json

with open('./Exported_Data/traits.json', 'r') as f:
    data = json.loads(f.read())

with open('./traits_data.sql', 'w') as f2:
    f2.write('INSERT INTO traits (trait_id, trait_name, descrip) \n\t VALUES ') 
    for trait in data['traits']:
        f2.write("\t('%s', '%s', '%s'),\n" % (trait['apiName'], trait['name'], trait['desc'].replace("'", "")))
