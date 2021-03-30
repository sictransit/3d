using CommandLine;
using QRCoder;
using Serilog;
using Serilog.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using static QRCoder.QRCodeGenerator;

namespace net.sictransit
{
    static class Program
    {
        public static void Main(string[] args)
        {
            LoggingLevelSwitch LoggingLevel = new();

            LoggingLevel.MinimumLevel = Serilog.Events.LogEventLevel.Information;

            Log.Logger = new LoggerConfiguration()
                .WriteTo.Console(Serilog.Events.LogEventLevel.Debug)
                .MinimumLevel.ControlledBy(LoggingLevel)
                .CreateLogger();

            var parser = new Parser(with =>
            {
                with.CaseInsensitiveEnumValues = true;
            });

            parser.ParseArguments<Options>(args)
                    .WithParsed(o =>
                    {
                        if (o.Debug)
                        {
                            LoggingLevel.MinimumLevel = Serilog.Events.LogEventLevel.Debug;
                        }

                        Encode(o.Text, o.ECC);

                    });
        }

        private static void Encode(string text, ECCLevel ecc)
        {
            Log.Information($"encoding: {text}");

            using var generator = new QRCodeGenerator();
            using var qr = generator.CreateQrCode(text, ecc);

            var lines = GetArrayDefinition(qr).Skip(4).Reverse().Skip(4).Reverse();

            var arrayDefinition = $"qr=\n[{string.Join(",\n", lines)}];";

            Log.Information(arrayDefinition);
        }

        private static IEnumerable<string> GetArrayDefinition(QRCodeData qr)
        {
            foreach (var matrix in qr.ModuleMatrix)
            {
                var bits = new bool[matrix.Length];
                matrix.CopyTo(bits, 0);

                var line = $"[{string.Join(", ", bits.Skip(4).Reverse().Skip(4).Reverse().Select(x => x ? 1 : 0))}]";

                yield return line;
            }
        }
    }
}
