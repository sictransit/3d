using CommandLine;
using static QRCoder.QRCodeGenerator;

namespace net.sictransit
{
    public class Options
    {
        [Option(Required = false, Default = @"Hello World!", HelpText = "encoded text, e.g. an URL")]
        public string Text { get; set; }

        [Option(Required = false, Default = false, HelpText = "debug")]
        public bool Debug { get; set; }

        [Option(Required = false, Default = ECCLevel.H, HelpText = "error correction capability")]
        public ECCLevel ECC { get; set; }
    }
}
