declare namespace rdf = "http://www.w3.org/1999/02/22-rdf-syntax-ns#" ;      (:@\label{namespace-start}@:)
declare namespace foaf = "http://xmlns.com/foaf/0.1/" ;
declare namespace mo = "http://purl.org/ontology/mo/" ;
declare namespace dc = "http://purl.org/dc/elements/1.1/" ;     (:@\label{namespace-end}@:)

let $bandPos := distinct-values(//band/@name)     (:@\label{pos-start}@:)
let $memberPos := distinct-values(//member)
let $albumPos := distinct-values(//album/@name)
let $songPos := distinct-values(//song)           (:@\label{pos-end}@:)

return
 <rdf:RDF> {
  for $band in //band                                                (:@\label{bands-start}@:)
  let $bandName := data($band/@name)
  let $bandID := fn:index-of($bandPos, $bandName)
  return
    <mo:MusicGroup rdf:nodeID="b{$bandID}" foaf:name="{$bandName}">{       (:@\label{nodeid}@:)
      for $member in $band//member
        let $memberID := fn:index-of($memberPos, $member)
        return <foaf:member rdf:nodeID="m{$memberID}"/>
    }</mo:MusicGroup>,                                                     (:@\label{bands-end}@:)

  for $memberName at $memberID in $memberPos                         (:@\label{artists-start}@:)
  return <mo:MusicArtist rdf:nodeID="m{$memberID}">
           <foaf:name>{$memberName}</foaf:name>
         </mo:MusicArtist>,                                          (:@\label{artists-end}@:)

  for $album in //album                                              (:@\label{albums-start}@:)
  let $albumName := data($album//@name)
  let $albumID := fn:index-of($albumPos, $albumName)
  let $bandID := fn:index-of($bandPos, data($album/../../@name))
  return <mo:Record rdf:nodeID="a{$albumID}">
           <mo:title>{$albumName}</mo:title>
           <foaf:maker rdf:nodeID="b{$bandID}"/>{
             for $song in $album//song
             let $songID := fn:index-of($songPos, $song)
             return <mo:track rdf:nodeID="s{$songID}"/>
         }</mo:Record>,                                              (:@\label{albums-end}@:)

  for $songName at $songID in $songPos                               (:@\label{songs-start}@:)
  return <mo:Track rdf:nodeID="s{$songID}">
           <dc:title>{$songName}</dc:title>
         </mo:Track>                                                 (:@\label{songs-end}@:)
 } </rdf:RDF>
