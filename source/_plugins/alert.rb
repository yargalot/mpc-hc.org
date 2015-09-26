module Jekyll
    module Tags
        class AlertTag < Liquid::Block

            def initialize(tag_name, type, tokens)
                super
                type.strip!
                if %w(info danger warning).include?(type)
                    @type = type
                else
                    raise "`#{type}` alert not supported"
                end
            end

            def render(context)
                site = context.registers[:site]
                converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
                output = converter.convert(super(context))
                if @type == "info"
                    @header = "Note"
                    @faClass = "fa-info-circle"
                else
                    @header = "Warning"
                    @faClass = "fa-exclamation-circle"
                end

                "<div class=\"alert alert-#{@type}\" role=\"alert\">"\
                    "<h4><span class=\"fa #{@faClass}\" aria-hidden=\"true\"></span> " + @header + "</h4>"\
                    "#{output}"\
                 "</div>"

            end
        end
    end
end

Liquid::Template.register_tag('alert', Jekyll::Tags::AlertTag)
