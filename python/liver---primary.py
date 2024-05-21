# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"55454.0","system":"readv2"},{"code":"27438.0","system":"readv2"},{"code":"4743.0","system":"readv2"},{"code":"44120.0","system":"readv2"},{"code":"22841.0","system":"readv2"},{"code":"92909.0","system":"readv2"},{"code":"40567.0","system":"readv2"},{"code":"102922.0","system":"readv2"},{"code":"18739.0","system":"readv2"},{"code":"21713.0","system":"readv2"},{"code":"6863.0","system":"readv2"},{"code":"58630.0","system":"readv2"},{"code":"109540.0","system":"readv2"},{"code":"69204.0","system":"readv2"},{"code":"19512.0","system":"readv2"},{"code":"6015.0","system":"readv2"},{"code":"100592.0","system":"readv2"},{"code":"44676.0","system":"readv2"},{"code":"3450.0","system":"readv2"},{"code":"60104.0","system":"readv2"},{"code":"25383.0","system":"readv2"},{"code":"71453.0","system":"readv2"},{"code":"16455.0","system":"readv2"},{"code":"16725.0","system":"readv2"},{"code":"91591.0","system":"readv2"},{"code":"58184.0","system":"readv2"},{"code":"68376.0","system":"readv2"},{"code":"108819.0","system":"readv2"},{"code":"100253.0","system":"readv2"},{"code":"40963.0","system":"readv2"},{"code":"15424.0","system":"readv2"},{"code":"48928.0","system":"readv2"},{"code":"7885.0","system":"readv2"},{"code":"8363.0","system":"readv2"},{"code":"7602.0","system":"readv2"},{"code":"1638.0","system":"readv2"},{"code":"8206.0","system":"readv2"},{"code":"96664.0","system":"readv2"},{"code":"100474.0","system":"readv2"},{"code":"17330.0","system":"readv2"},{"code":"26319.0","system":"readv2"},{"code":"9494.0","system":"readv2"},{"code":"47257.0","system":"readv2"},{"code":"7943.0","system":"readv2"},{"code":"73482.0","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('liver-fibrosis-sclerosis-and-cirrhosis-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["liver---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["liver---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["liver---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
