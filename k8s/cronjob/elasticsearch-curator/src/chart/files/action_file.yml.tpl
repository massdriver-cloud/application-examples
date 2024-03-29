# Remember, leave a key empty if there is no value.  None will be a string,
# not a Python "NoneType"
#
# Also remember that all examples have 'disable_action' set to True.  If you
# want to use this action as a template, be sure to set this to False after
# copying it.
actions:
  1:
    action: delete_indices
    description: "Clean up ES by deleting old indices"
    options:
      timeout_override:
      continue_if_exception: False
      disable_action: False
      ignore_empty_list: True
    filters:
    - filtertype: age
      source: name
      direction: older
      timestring: '%Y.%m.%d'
      unit: {{ .Values.configuration.age.unit }}
      unit_count: {{ .Values.configuration.age.unit_count }}
      field:
      stats_result:
      epoch:
      exclude: False
