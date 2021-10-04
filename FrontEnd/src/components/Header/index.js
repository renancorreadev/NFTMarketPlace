import React from 'react';
import styles from './header.module.scss';
import getWeb3, { getGanacheWeb3, Web3 } from "../../utils/getWeb3";
import logo from '../../../public/logo.png'
import { style } from 'rimble-ui';
import Wallet from '../Wallet/index'
import Web3Info from '../Web3Info/index'
const Header = () => (
    <div className={styles.header}>
    
    <img className={styles.logos} src={logo}/>
        <nav id="menu" className="menu">
          <ul>
            
            <li className={styles.mainus}><a href="sheeptoken.cash" className={styles.link}>HomeSheep</a></li>

            <li  className={styles.mainus}><a href="/create" className={styles.link}>Create</a></li>

            <li className={styles.mainus}><a href="/my_nfts" className={styles.link }>Assets</a></li>

            {process.env.NODE_ENV !== 'marketplace' && (
              <li className={styles.mainus}><a href="/marketplace" className={styles.link}> MarketPlace</a></li>
            )}
          </ul>
        
          <Wallet > </Wallet>
          
        </nav>
    </div>
)

export default Header;
