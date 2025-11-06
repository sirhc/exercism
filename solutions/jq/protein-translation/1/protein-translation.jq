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

def map_codons:
  if . | length == 0 then
    []
  else
    (.[0:3] | protein) as $protein |

    if $protein | not then
      "Invalid codon" | halt_error
    elif $protein == "STOP" then
      []
    else
      [$protein] + (.[3:] | map_codons)
    end
  end
;

# "AUG" | map_codons
# "AUGUUU" | map_codons
# "AUGUAAAUG" | map_codons
.strand | map_codons
