using RazorLight;

var engine = new RazorLightEngineBuilder()
    .UseFileSystemProject("Templates")
    .UseMemoryCachingProvider()
    .Build();

var html = await engine.CompileRenderAsync(
    "index.cshtml",
    new { });

string path = Path.Combine("../docs");
Directory.CreateDirectory("../docs");

await File.WriteAllTextAsync(
    "../docs/index.html",
    html);

Console.WriteLine("Generated docs/index.html");