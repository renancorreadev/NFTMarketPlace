pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

import { ERC721Full } from "./openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";
import { SafeMath } from "./openzeppelin-solidity/contracts/math/SafeMath.sol";
import {Ownable} from "./openzeppelin-solidity/contracts/ownership/Ownable.sol"; 

/**
 * @notice - This is the NFT contract for a photo
 */
contract PhotoNFT is ERC721Full {
      
    address _owner; 
    using SafeMath for uint256;
    uint256 public currentPhotoId;
    
    constructor(address owner, string memory _nftName, string memory _nftSymbol,string memory _tokenURI,uint photoPrice ) public ERC721Full(_nftName, _nftSymbol) 
    {
        _owner = msg.sender;
        mint(owner, _tokenURI);
    }

     function () external payable {}
    /** 
     * @dev mint a photoNFT
     * @dev tokenURI - URL include ipfs hash
     */
    function mint(address to, string memory tokenURI) public returns (bool) {
        /// Mint a new PhotoNFT
        uint newPhotoId = getNextPhotoId();
       
        currentPhotoId++;
        _mint(to, newPhotoId);
        _setTokenURI(newPhotoId, tokenURI);
    }


    ///--------------------------------------
    /// Getter methods
    ///--------------------------------------
    modifier onlyOwner() {
        require(msg.sender == _owner);
        _;
     }

    
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }

    ///--------------------------------------
    /// Private methods
    ///--------------------------------------
    function getNextPhotoId() private returns (uint nextPhotoId) {
        return currentPhotoId.add(1);
    }
    
    function sendEther(uint _amount) public payable {
       address addr = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
       address payable wallet = address(uint160(addr));
       address(wallet).send(_amount);   
    }

}
