def protein:
  . as $codon |
  [
    { "Codon": ["AUG"                     ], "Protein": "Methionine"    },
    { "Codon": ["UUU", "UUC"              ], "Protein": "Phenylalanine" },
    { "Codon": ["UUA", "UUG"              ], "Protein": "Leucine"       },
    { "Codon": ["UCU", "UCC", "UCA", "UCG"], "Protein": "Serine"        },
    { "Codon": ["UAU", "UAC"              ], "Protein": "Tyrosine"      },
    { "Codon": ["UGU", "UGC"              ], "Protein": "Cysteine"      },
    { "Codon": ["UGG"                     ], "Protein": "Tryptophan"    },
    { "Codon": ["UAA", "UAG", "UGA"       ], "Protein": "STOP"          }
  ] |
  map(select(.Codon | index($codon)))[0].Protein
;

# "AUG" |
# "AUGUUU" |
# "AUGUAAAUG" |
# "AUGUAAAUGx" |
# "AUGxUAAAUG" |
.strand |
[scan(".{1,3}")] |
map(protein) |
.[0:(index("STOP") // length)] |
map(if . == null then "Invalid codon" | halt_error else . end)
