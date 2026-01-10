{
    'name': 'PetFood Data Import',
    'version': '1.0',
    'category': 'Manufacturing',
    'summary': 'Odoo 19.x Certified Data Import for PetFood Manufacturing',
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
