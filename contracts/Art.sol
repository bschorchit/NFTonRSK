pragma solidity 0.5.7;

import '@openzeppelin/contracts/token/ERC721/ERC721Full.sol';

contract Art is ERC721Full {

  bytes3[] public arts;
  mapping(bytes32 => bool) private _artExists;

  constructor() ERC721Full("Art", "ART") public {
  }

  // E.G. art = "#FFFFFF"
  function mint(bytes32 _art) public {
    require(!_artExists[_art], "art exists");
    uint _id = arts.push(_art);
    _mint(msg.sender, _id);
    _artExists[_art] = true;
  }
}