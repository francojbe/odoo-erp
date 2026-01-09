{
    'name': 'PetFood Data Import',
    'version': '1.0',
    'category': 'Custom',
    'summary': 'Import data from PetFood Excel',
    'depends': ['mrp', 'stock', 'product'],
    'data': [
        'data/product_template.csv',
        'data/mrp_bom.csv',
        'data/mrp_bom_line.csv',
    ],
    'installable': True,
    'application': False,
    'license': 'LGPL-3',
}
