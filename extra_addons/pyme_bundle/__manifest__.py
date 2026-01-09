{
    'name': 'Pyme Bundle',
    'version': '1.0',
    'category': 'Custom',
    'summary': 'Fijar aplicaciones minimas para Pyme',
    'description': """
        Este modulo instala automaticamente las aplicaciones esenciales para una Pyme:
        - Ventas
        - Facturacion
        - CRM
        - Inventario
        - Compras
    """,
    'depends': [
        'sale',
        'account', 
        'crm',
        'stock',
        'purchase',
        'mrp',
    ],
    'installable': True,
    'application': True,
    'license': 'LGPL-3',
}
