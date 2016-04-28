{%- extends 'display_priority.tpl' -%}


{% block codecell %}
<div>
{{ super() }}
</div>
{%- endblock codecell %}

{% block input_group -%}
<div>
{{ super() }}
</div>
{% endblock input_group %}

{% block output_group %}
<div>
<div>
{{ super() }}
</div>
</div>
{% endblock output_group %}

{% block in_prompt -%}
{%- endblock in_prompt %}

{% block empty_in_prompt -%}
<div>
</div>
{%- endblock empty_in_prompt %}

{# 
  output_prompt doesn't do anything in HTML,
  because there is a prompt div in each output area (see output block)
#}
{% block output_prompt %}
{% endblock output_prompt %}

{% block input %}
<div>
<div>
{{ cell.source | highlight_code(metadata=cell.metadata) }}
</div>
</div>
{%- endblock input %}

{% block output %}
<div>
{%- if output.output_type == 'execute_result' -%}
    <div>
{%- else -%}
    <div>
{%- endif -%}
    </div>
{{ super() }}
</div>
{% endblock output %}

{% block markdowncell scoped %}
<div>
{{ self.empty_in_prompt() }}
<div>
<div>
{{ cell.source  | markdown2html | strip_files_prefix }}
</div>
</div>
</div>
{%- endblock markdowncell %}

{% block unknowncell scoped %}
unknown type  {{ cell.type }}
{% endblock unknowncell %}

{% block execute_result -%}
{%- set extra_class="output_execute_result" -%}
{% block data_priority scoped %}
{{ super() }}
{% endblock %}
{%- set extra_class="" -%}
{%- endblock execute_result %}

{% block stream_stdout -%}
<div>
<pre>
{{- output.text | ansi2html -}}
</pre>
</div>
{%- endblock stream_stdout %}

{% block stream_stderr -%}
<div>
<pre>
{{- output.text | ansi2html -}}
</pre>
</div>
{%- endblock stream_stderr %}

{% block data_svg scoped -%}
<div>
{%- if output.svg_filename %}
<img src="{{output.svg_filename | posix_path}}"
{%- else %}
{{ output.data['image/svg+xml'] }}
{%- endif %}
</div>
{%- endblock data_svg %}

{% block data_html scoped -%}
<div>
{{ output.data['text/html'] }}
</div>
{%- endblock data_html %}

{% block data_markdown scoped -%}
<div>
{{ output.data['text/markdown'] | markdown2html }}
</div>
{%- endblock data_markdown %}

{% block data_png scoped %}
<div>
{%- if 'image/png' in output.metadata.get('filenames', {}) %}
<img src="{{output.metadata.filenames['image/png'] | posix_path}}"
{%- else %}
<img src="data:image/png;base64,{{ output.data['image/png'] }}"
{%- endif %}
{%- if 'width' in output.metadata.get('image/png', {}) %}
width={{output.metadata['image/png']['width']}}
{%- endif %}
{%- if 'height' in output.metadata.get('image/png', {}) %}
height={{output.metadata['image/png']['height']}}
{%- endif %}
>
</div>
{%- endblock data_png %}

{% block data_jpg scoped %}
<div>
{%- if 'image/jpeg' in output.metadata.get('filenames', {}) %}
<img src="{{output.metadata.filenames['image/jpeg'] | posix_path}}"
{%- else %}
<img src="data:image/jpeg;base64,{{ output.data['image/jpeg'] }}"
{%- endif %}
{%- if 'width' in output.metadata.get('image/jpeg', {}) %}
width={{output.metadata['image/jpeg']['width']}}
{%- endif %}
{%- if 'height' in output.metadata.get('image/jpeg', {}) %}
height={{output.metadata['image/jpeg']['height']}}
{%- endif %}
>
</div>
{%- endblock data_jpg %}

{% block data_latex scoped %}
<div>
{{ output.data['text/latex'] }}
</div>
{%- endblock data_latex %}

{% block error -%}
<div>
<pre>
{{- super() -}}
</pre>
</div>
{%- endblock error %}

{%- block traceback_line %}
{{ line | ansi2html }}
{%- endblock traceback_line %}

{%- block data_text scoped %}
<div>
<pre>
{{- output.data['text/plain'] | ansi2html -}}
</pre>
</div>
{%- endblock -%}

{%- block data_javascript scoped %}
<div>
<script type="text/javascript">
{{ output.data['text/javascript'] }}
</script>
</div>
{%- endblock -%}
