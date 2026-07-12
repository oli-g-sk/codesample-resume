using RazorLight;

var appRoot = AppContext.BaseDirectory;

var templateRoot = Path.Combine(appRoot, "Templates");
var outputRoot = Path.Combine(appRoot, "wwwroot");

Directory.CreateDirectory(outputRoot);

var engine = new RazorLightEngineBuilder()
    .UseFileSystemProject(templateRoot)
    .UseMemoryCachingProvider()
    .Build();

var html = await engine.CompileRenderAsync(
    "index.cshtml",
    new { });

var indexPath = Path.Combine(outputRoot, "index.html");

await File.WriteAllTextAsync(indexPath, html);

Console.WriteLine($"Generated: {indexPath}");