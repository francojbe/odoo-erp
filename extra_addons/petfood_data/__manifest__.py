{
    'name': 'PetFood Data Import',
    'version': '1.2',
    'category': 'Manufacturing',
    'summary': 'Odoo 19.x Certified Data Import - DefaultCode Bridge',
    'depends': ['mrp', 'stock', 'product'],
    'data': [
        'data/product.template.csv',
        'data/mrp.bom.csv',
        'data/mrp.bom.line.csv',
    ],
    'installable': True,
    'application': False,
    'license': 'LGPL-3',
}
