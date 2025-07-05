# Export globe data column (e.g. height, lat, lon) from Blender
col_name = 'height'
mesh = bpy.data.objects[4].evaluated_get(bpy.context.evaluated_depsgraph_get()).to_mesh()
attr = mesh.attributes[col_name]

with open('/path_to_csv/export.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    for i in range(len(dom)):
        row = []
        row.append(attr.data[i].value)
        writer.writerow(row)

