def assert_valid:
  if [match("[^ACGT]"; "")] | length > 0 then
    "Invalid nucleotide in strand" | halt_error
  else
    .
  end
;

def count_nucleotides(strand):
  . as $nucleotide |
  strand | {($nucleotide): [match($nucleotide; "g")] | length}
;

.strand as $strand |
.strand |
assert_valid |
["A", "C", "G", "T"] | map(count_nucleotides($strand)) | add
