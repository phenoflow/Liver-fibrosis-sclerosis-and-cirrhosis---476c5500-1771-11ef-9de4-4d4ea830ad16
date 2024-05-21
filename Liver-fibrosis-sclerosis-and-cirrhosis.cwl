cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  portal-liver-fibrosis-sclerosis-and-cirrhosis---primary:
    run: portal-liver-fibrosis-sclerosis-and-cirrhosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  hepatic-liver-fibrosis-sclerosis-and-cirrhosis---primary:
    run: hepatic-liver-fibrosis-sclerosis-and-cirrhosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: portal-liver-fibrosis-sclerosis-and-cirrhosis---primary/output
  liver-fibrosis-sclerosis-and-cirrhosis---primary:
    run: liver-fibrosis-sclerosis-and-cirrhosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: hepatic-liver-fibrosis-sclerosis-and-cirrhosis---primary/output
  alcoholic-liver-fibrosis-sclerosis-and-cirrhosis---primary:
    run: alcoholic-liver-fibrosis-sclerosis-and-cirrhosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: liver-fibrosis-sclerosis-and-cirrhosis---primary/output
  toxic-liver-fibrosis-sclerosis-and-cirrhosis---primary:
    run: toxic-liver-fibrosis-sclerosis-and-cirrhosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: alcoholic-liver-fibrosis-sclerosis-and-cirrhosis---primary/output
  other-liver-fibrosis-sclerosis-and-cirrhosis---primary:
    run: other-liver-fibrosis-sclerosis-and-cirrhosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: toxic-liver-fibrosis-sclerosis-and-cirrhosis---primary/output
  liver-fibrosis-sclerosis-and-cirrhosis-unspecified---primary:
    run: liver-fibrosis-sclerosis-and-cirrhosis-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: other-liver-fibrosis-sclerosis-and-cirrhosis---primary/output
  chronic-liver-fibrosis-sclerosis-and-cirrhosis---primary:
    run: chronic-liver-fibrosis-sclerosis-and-cirrhosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: liver-fibrosis-sclerosis-and-cirrhosis-unspecified---primary/output
  secondary-liver-fibrosis-sclerosis-and-cirrhosis---primary:
    run: secondary-liver-fibrosis-sclerosis-and-cirrhosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: chronic-liver-fibrosis-sclerosis-and-cirrhosis---primary/output
  liver-fibrosis-sclerosis-and-cirrhosis-biliary---primary:
    run: liver-fibrosis-sclerosis-and-cirrhosis-biliary---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: secondary-liver-fibrosis-sclerosis-and-cirrhosis---primary/output
  liver-fibrosis-sclerosis-and-cirrhosis-hepatitis---primary:
    run: liver-fibrosis-sclerosis-and-cirrhosis-hepatitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: liver-fibrosis-sclerosis-and-cirrhosis-biliary---primary/output
  liver---primary:
    run: liver---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: liver-fibrosis-sclerosis-and-cirrhosis-hepatitis---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: liver---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
