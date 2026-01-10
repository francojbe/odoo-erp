{
    'name': 'PetFood Data Import',
    'version': '1.1',
    'category': 'Manufacturing',
    'summary': 'Odoo 19.x Certified Data Import - Architecture V2',
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
