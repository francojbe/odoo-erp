{
    'name': 'PetFood Data Import',
    'version': '1.0',
    'category': 'Custom',
    'summary': 'Import data from PetFood Excel',
    'depends': ['mrp', 'stock', 'product'],
    'data': [
        'data/product.template.csv',
        'data/product_variant_bindings.xml',
        'data/mrp.bom.csv',
        'data/mrp.bom.line.csv',
    ],
    'installable': True,
    'application': False,
    'license': 'LGPL-3',
}
