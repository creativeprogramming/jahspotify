package jahspotify.media;

import java.util.*;


public class Library
{
    public static final Library EMPTY = new Library();

    private String owner;
    private Collection<LibraryEntry> entries;

    public Library()
    {
        this.owner = null;
        this.entries = new LinkedHashSet<LibraryEntry>();
    }

    public String getOwner()
    {
        return this.owner;
    }

    public void setOwner(String owner)
    {
        this.owner = owner;
    }

    public Collection<LibraryEntry> getEntries()
    {
        return this.entries;
    }

    public void addEntry(LibraryEntry content)
    {
        this.entries.add(content);
    }

    public String toString()
    {
        return String.format("[RootFolder: %s, %d]", this.owner,0);
    }

}
