namespace CvGen.Model;

public record Library
(
    string Name,
    string RepoUrl,
    List<Package> Packages
);