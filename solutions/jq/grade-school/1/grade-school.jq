.property as $property |
.input    as $input |

[
  .input.students |

    # Only allow the first instance of a student.
    unique_by(.[0]) |

    # Filter students by grade if requested.
    if $property == "grade" then map(select(.[1] == $input.desiredGrade)) end |

    # We don't bother checking if the property is "roster", because that's the default behavior.

    # Group students by grade. This has the side effect of sorting by the grade.
    group_by(.[1])[] |

    map(.[0]) | sort[]
]
