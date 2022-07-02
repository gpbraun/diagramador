import psycopg2
from topic import links2topic
import json
from convert import copy_all

#
# MAIN
#

def main():
    # copy_all('database/images', 'temp/Pensi2022/images')

    conn = psycopg2.connect(
        host='editor.painelcupula.com',
        port=5432,
        database='codimd',
        user='codimd',
        password='change_password'
    )
    cur = conn.cursor()
    print("Conectado")

    with open('database/simulados.json', 'r') as json_file:
        simulados = json.load(json_file)

        for name, data in simulados.items():
            if name not in ['4-FIS', '4-QUI']:
                continue

            p = links2topic(
                cur,
                name, 
                data['problems'],
                area='Pensi2022', 
                title=data['title'],
                template=data['template'],
            ) 
            # caderno de questões
            p.generate_pdf(name, print_level=0)
            # gabarito
            p.generate_pdf(name+'-S', print_level=2)

    cur.close()
    conn.close()


if __name__ == "__main__":
    main()
