import sys


if len(sys.argv) < 2:
	print("Usage: python GetGeneListFromOMIM.py <in.OMIM_phenotype>")
	sys.exit()

infile = open(sys.argv[1],'r')
outfile = open("%s_genelist"%sys.argv[1],'w')

Genes = {}
for line in infile:
	if line[0]=='#':
		continue
	cols = line.strip('\n').split('\t')
	disease = cols[0]
	geneID = cols[1].split(',')[0]
	print(geneID)
	if geneID[0:3]=='DEL' or geneID[0:3]=='DUP':
		continue
	if geneID in Genes.keys():
		Genes[geneID].append(disease)
	else:
		Genes[geneID] = []
		Genes[geneID].append(disease)
for each in Genes:
	outfile.write("%s\t"%each)
	for disease in Genes[each]:
		outfile.write("%s\t"%disease)
	outfile.write("\n")

