declare namespace rdf = "http://www.w3.org/1999/02/22-rdf-syntax-ns#" ;      (:@\label{low-namespace-start}@:)
declare namespace foaf = "http://xmlns.com/foaf/0.1/" ;
declare namespace mo = "http://purl.org/ontology/mo/" ;
declare namespace dc = "http://purl.org/dc/elements/1.1/" ;     (:@\label{low-namespace-end}@:)

<user>
  <bands>{
  for $band in //mo:MusicGroup                                  (:@\label{low-bands-start}@:)
  return <band name="{$band/@foaf:name}">
           <members>{
             for $member in $band/foaf:member             (:@\label{low-members-start}@:)
             return <member>{
               //mo:MusicArtist[@rdf:about = $member/@rdf:resource]/foaf:name/text()
             }</member>                                      (:@\label{low-members-end}@:)
           }</members>
           <albums>{
             for $album in //mo:Record[./foaf:maker/@rdf:resource = $band/@rdf:about]          (:@\label{low-albums-start}@:)
             return <album name="{$album//mo:title}">{
                 for $song in $album/mo:track/@rdf:nodeID                                      (:@\label{low-songs-start}@:)
                 return <song>{//mo:Track[@rdf:nodeID = $song]/dc:title/text()}</song>         (:@\label{low-songs-end}@:)
               }</album>                                       (:@\label{low-albums-end}@:)
           }</albums>
         </band>                                            (:@\label{low-bands-end}@:)
}</bands></user>
