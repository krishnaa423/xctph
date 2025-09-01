#!/usr/bin/env python3

from fpflow.inputs.inputyaml import InputYaml
from fpflow.steps.qe.pseudos import QePseudosStep

inputdict: dict = InputYaml.from_yaml_file('./input.yaml').inputdict
QePseudosStep(inputdict).generate_pseudos()
